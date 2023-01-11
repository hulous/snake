# snake_ruby_game

## Run
Run `rake run`

## Dev
### Set up
Gosu have some _needs_... on linux debian for example:
```shell
sudo apt-get install build-essential libsdl2-dev libsdl2-ttf-dev \
                     libpango1.0-dev libgl1-mesa-dev libfreeimage-dev \
                     libopenal-dev libsndfile1-dev
```

Run `bundle install`

### Testing
Run `rake app:spec`

To get covering repport run `rake app:spec:coverage`

### Linter
Run `rake app:linter:all`
