#!/usr/bin/env perl

$latex = 'uplatex -kanji=utf8 -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
# -synctex=1
#   エディタとビューワーのカーソル位置と同じ箇所を行き来できる
# -halt-on-error
#   コンパイルエラーの際にインタラクティブに応答を求めず終了する
# -interaction=nonstopmode
#   上を指定していても `no such file was found` なエラーには対応できないので，それを潰す
# -file-line-error
#   エラーの起きたファイルとラインを表示する

$bibtex                      = 'upbibtex %O %B';
$dvipdf                      = 'dvipdfmx %O -o %D %S';
$makeindex                   = 'mendex -U %O -o %D %S';

$max_repeat = 5;
#ソースの変更なしでコンパイルできる上限．

$pdf_mode = 3;
# 0：pdf化しない
# 1：pdflatexを使用
# 2：ps2pdfを使用
# 3：dviファイルからpdfを生成

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer = 'open -a /Applications/Skim.app';
# Skimの場所を指定する
