require 'mkmf'

mecab_config = with_config('mecab-config', 'mecab-config')
use_mecab_config = enable_config('mecab-config')

$LDFLAGS += ' -L' + `#{mecab_config} --libs-only-L`.chomp

$LIBS += '-L/usr/local/Cellar/mecab/0.99/lib'
`mecab-config --libs-only-l`.chomp.split.each { | lib |
  have_library(lib)
}

$CFLAGS += ' ' + `#{mecab_config} --cflags`.chomp

have_header('mecab.h') && create_makefile('MeCab')
