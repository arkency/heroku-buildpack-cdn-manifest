# heroku-buildpack-cdn-manifest

Download asset manifest file from CDN host connected to Digital Ocean Spaces. Asset manifest maps filenames with their digested counterparts. It is need on Heroku side, when your digested assets are served solely from CDN asset host.

## Prerequisites

    $ heroku buildpacks:add https://github.com/arkency/heroku-buildpack-cdn-manifest
    $ heroku config:add DIGITAL_OCEAN_SPACES_KEY=...
    $ heroku config:add DIGITAL_OCEAN_SPACES_SECRET=...
