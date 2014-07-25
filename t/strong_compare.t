use strict;
use warnings;

use Test::More;
use HTTP::Entity::Compare;

subtest "" => sub {
    is 1,1;
};

subtest "" => sub {
    is(HTTP::Entity::Compare->strong_compare('xyzzy', '"xyzzy", "r2d2xxxx", "c3piozzzz"'), 1);
};

subtest "" => sub {
    is (HTTP::Entity::Compare->strong_compare('xyzzy', 'W/"xyzzy", "r2d2xxxx", "c3piozzzz"'), 0);
};

subtest "" => sub {
    is (HTTP::Entity::Compare->strong_compare('xxxxx', 'W/"xyzzy", "r2d2xxxx", "c3piozzzz"'), 0);
};

done_testing;
