#!/bin/bash

BIN=/usr/bin
MAN=/usr/share/man/man1

PRIORITY=360
BINV=6.0
MANV=6.0.1

sudo update-alternatives --install $BIN/clang clang $BIN/clang-$BINV $PRIORITY \
    --slave $BIN/clang++                        clang++                     $BIN/clang++-$BINV \
    --slave $BIN/clang-apply-replacements       clang-apply-replacements    $BIN/clang-apply-replacements-$BINV \
    --slave $BIN/clang-check                    clang-check                 $BIN/clang-check-$BINV \
    --slave $BIN/clang-query                    clang-query                 $BIN/clang-query-$BINV \
    --slave $BIN/clang-rename                   clang-rename                $BIN/clang-rename-$BINV \
    --slave $BIN/clang-format                   clang-format                $BIN/clang-format-$BINV \
    --slave $BIN/clang-format-diff              clang-format-diff           $BIN/clang-format-diff-$BINV \
    --slave $BIN/clang-tidy                     clang-tidy                  $BIN/clang-tidy-$BINV \
    --slave $BIN/asan_symbolize                 asan_symbolize              $BIN/asan_symbolize-$BINV \
    --slave $MAN/clang.gz                       clang.gz                    $MAN/clang-$MANV.gz \
    --slave $MAN/clang-apply-replacements.gz    clang-apply-replacements.gz $MAN/clang-apply-replacements-$MANV.gz \
    --slave $MAN/clang-check.gz                 clang-check.gz              $MAN/clang-check-$MANV.gz \
    --slave $MAN/clang-format.gz                clang-format.gz             $MAN/clang-format-$MANV.gz \
    --slave $MAN/clang-format-diff.gz           clang-format-diff.gz        $MAN/clang-format-diff-$MANV.gz \
    --slave $MAN/clang-tidy.gz                  clang-tidy.gz               $MAN/clang-tidy-$MANV.gz \
    --slave $MAN/scan-view.gz                   scan-view.gz                $MAN/scan-view-$MANV.gz \
    --slave $MAN/scan-build.gz                  scan-build.gz               $MAN/scan-build-$MANV.gz \
