use utf8;

use Test::Base;
use Text::Md2Inao;
use Encode;
use Text::Md2Inao::Builder::InDesign;

plan tests => 1 * blocks;

run_is in => 'expected';

sub md2inao {
    my $p = Text::Md2Inao->new({
        default_list           => 'disc',
        max_list_length        => 63,
        max_inline_list_length => 55,
        builder                => Text::Md2Inao::Builder::InDesign->new,
    });
    $p->parse($_);
}

__END__
=== basic spec
--- in md2inao
Title: Markdown to Inao
Subtitle: Convert markdown text to Inao format
Chapter: 3
Serial: 5
Author: 伊藤 直也
Supervisor: 稲尾
URL: http://naoya.github.com/
mail: i.naoya@gmail.com
Github: naoya
Twitter: @naoya_ito


Hello, World
--- expected
<SJIS-MAC>
<ParaStyle:章番号・連載回数>章番号：3章
<ParaStyle:章番号・連載回数>連載回数：第5回
<ParaStyle:タイトル>タイトル：Markdown to Inao
<ParaStyle:キャッチ>キャッチ：Convert markdown text to Inao format
<ParaStyle:本文>著者：伊藤 直也
<ParaStyle:本文>監修：稲尾
<ParaStyle:本文>URL：http://naoya.github.com/
<ParaStyle:本文>mail：i.naoya@gmail.com
<ParaStyle:本文>Github：naoya
<ParaStyle:本文>Twitter：@naoya_ito
<ParaStyle:本文>Hello, World