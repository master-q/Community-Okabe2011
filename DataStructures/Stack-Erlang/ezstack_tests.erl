-module(ezstack_tests).
-include_lib("eunit/include/eunit.hrl").

s0() -> ezstack:empty().
s1() -> ezstack:cons(1, s0()).
s2() -> ezstack:cons(2, s1()).
s3() -> ezstack:cons(3, s2()).

is_empty_s0_test() -> ?assert(ezstack:is_empty(s0())).
is_empty_s1_test() -> ?assertNot(ezstack:is_empty(s1())).
is_empty_s2_test() -> ?assertNot(ezstack:is_empty(s2())).
is_empty_s3_test() -> ?assertNot(ezstack:is_empty(s3())).

head_s0_test() -> ?assertError(function_clause, ezstack:head(s0)).
head_s1_test() -> ?assertEqual(ezstack:head(s1()), 1).
head_s2_test() -> ?assertEqual(ezstack:head(s2()), 2).
head_s3_test() -> ?assertEqual(ezstack:head(s3()), 3).

tail_s0_test() -> ?assertError(function_clause, ezstack:tail(s0)).
tail_s1_test() -> ?assertEqual(ezstack:tail(s1()), s0()).
tail_s2_test() -> ?assertEqual(ezstack:tail(s2()), s1()).
tail_s3_test() -> ?assertEqual(ezstack:tail(s3()), s2()).
