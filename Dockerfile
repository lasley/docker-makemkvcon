FROM debian:stretch
MAINTAINER Dave Lasley <dave@dlasley.net>

ARG MAKEMKV_VERSION=1.10.6
ARG PREFIX=/usr/local

# Install MakeMKV dependencies.
RUN set -ex; \
    buildDeps=' \
		ca-certificates \
		g++ \
		gcc-6 \
		libavcodec-dev \
		libexpat-dev \
		libqt4-dev \
		libssl-dev \
		make \
		pkg-config \
		wget \
		zlib1g-dev \
	'; \
   	apt-get update; \
	apt-get install -y --no-install-recommends $buildDeps; \
	apt-get install -y ca-certificates-java \
	                   openjdk-8-jre-headless \
	                   python; \
    \
# Install MakeMKV.
 	for pkg in makemkv-oss makemkv-bin; do \
		wget -O "${pkg}.tgz" "http://www.makemkv.com/download/${pkg}-${MAKEMKV_VERSION}.tar.gz"; \
		mkdir -p "${pkg}"; \
		tar -xvf "${pkg}.tgz" -C "${pkg}" --strip-components=1; \
		rm "${pkg}.tgz"; \
		cd "${pkg}"; \
		if [ -f configure ]; then \
			./configure --prefix="${PREFIX}"; \
		else \
			mkdir -p tmp; \
			touch tmp/eula_accepted; \
		fi; \
		make -j "$(nproc)" PREFIX="${PREFIX}"; \
		make install PREFIX="${PREFIX}"; \
		cd ..; \
		rm -r "${pkg}"; \
	done; \
    \
# Some of the packages are still required.
 	apt-mark manual \
		libavcodec57 \
		libqtdbus4 \
		libqtgui4 \
		libssl1.1 \
	; \
	\
# Save the beta key for usage in entrypoint.
 	wget -S --no-check-certificate -O - "http://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053" \
	    | awk 'FNR == 243 {print $57}' \
	    | cut -c 21-88 > /BETA_KEY; \
    \
# Purge the cache and dependencies.
    rm -rf /var/lib/apt/lists/*; \
    apt-get purge -y --auto-remove $buildDeps;

RUN mkdir -p ~/.MakeMKV

COPY bin/entrypoint.sh /entrypoint.sh
COPY entrypoint.d/ /entrypoint.d/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["makemkvcon"]
