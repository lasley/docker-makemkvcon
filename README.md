[![License: Apache 2.0](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/lasley/docker-makemkv.svg?branch=master)](https://travis-ci.org/lasley/docker-makemkv)

[![](https://images.microbadger.com/badges/image/lasley/docker-makemkv.svg)](https://microbadger.com/images/lasley/docker-makemkv "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/lasley/docker-makemkv.svg)](https://microbadger.com/images/lasley/docker-makemkv "Get your own version badge on microbadger.com")

MakeMKVCon
==========

This image provides MakeMKV command line in a Docker container.

If you are looking for MakeMKV UI, you should instead use an image such as [tobbenb/makemkv-rdp](https://hub.docker.com/r/tobbenb/makemkv-rdp/).

Build Arguments
===============

The following build arguments are available for customization:


| Name | Default | Description |
|------|---------|-------------|
| `MAKEMKV_VERSION` | Most recent version | Version of MakeMKV to install |
| `PREFIX` | `/usr/local` | Where to install MakeMKV |

Environment Variables
=====================

The following environment variables are available for your configuration
pleasure:

| Name | Default | Description |
|------|---------|-------------|
| `APP_KEY` | None | MakeMKV software key. If this is left blank, a beta key will be downloaded and used. |

Known Issues / Roadmap
======================

Bug Tracker
===========

Bugs are tracked on [GitHub Issues](https://github.com/lasley/docker-makemkv/issues).
In case of trouble, please check there to see if your issue has already been reported.
If you spotted it first, help us smash it by providing detailed and welcomed feedback.

Credits
=======

Contributors
------------

* Dave Lasley <dave@dlasley.net>

Maintainer
----------

This module is maintained by [Dave Lasley](https://twitter.com/dlasley88)

* https://github.com/lasley/docker-makemkv
