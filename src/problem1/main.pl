use strict;
use warnings;

# ライブラリのロードパスを設定
use File::Basename;
use lib dirname(__FILE__).'/lib';

# データを良い感じに出力してくれるモジュール
# デバッグの時に便利
use Data::Dumper;

# lib/ 以下のSorter.pmをインクルードする
use Sorter;

my $sorter = Sorter->new;
$sorter->set_values(5,4,3,-30,2,1,22,44,11,9,19);
$sorter->sort;
my @array = $sorter->get_values; # (1,2,3,4,5) が返ってくる

print Dumper \@array;
