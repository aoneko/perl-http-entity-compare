# NAME

HTTP::Entity::Compare - It's new $module

# SYNOPSIS

    use HTTP::Entity::Compare;

    HTTP::Entity::Compare->strong_compare('xyzzy', '"xyzzy", "r2d2xxxx", "c3piozzzz"');     # 1
    HTTP::Entity::Compare->strong_compare('xyzzy', 'W/"xyzzy", "r2d2xxxx", "c3piozzzz"');   # 0
    HTTP::Entity::Compare->weak_compare('xyzzy', 'W/"xyzzy", "r2d2xxxx", "c3piozzzz"');     # 1
    HTTP::Entity::Compare->weak_compare('W/"xyzzy"', 'W/"xyzzy", "r2d2xxxx", "c3piozzzz"'); # 1


# DESCRIPTION

HTTP::Entity::Compare is ...

# LICENSE

Copyright (C) aoneko.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

aoneko <aoneko@cpan.org>
