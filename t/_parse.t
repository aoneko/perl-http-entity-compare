use strict;
use warnings;

use Test::More;
use HTTP::Entity::Compare;

subtest "" => sub {
    my $parsed = HTTP::Entity::Compare->_parse('"xyzzy", "r2d2xxxx", "c3piozzzz"');

    is_deeply $parsed, [
        { "opaque-tag" => "xyzzy"     },
        { "opaque-tag" => "r2d2xxxx"  },
        { "opaque-tag" => "c3piozzzz" },
    ];
};

subtest "" => sub {
    my $parsed = HTTP::Entity::Compare->_parse('"xyzzy", W/"r2d2xxxx", W/"c3piozzzz"');
    is_deeply $parsed, [
        { "opaque-tag" => "xyzzy"     },
        { "opaque-tag" => "r2d2xxxx",  weak => 1 },
        { "opaque-tag" => "c3piozzzz", weak => 1 },
    ];
};



done_testing;
