-module(ezqueue_tests).
-include_lib("eunit/include/eunit.hrl").

q0() -> ezqueue:empty().
q1() -> ezqueue:snoc(1, q0()).
q2() -> ezqueue:snoc(2, q1()).
q3() -> ezqueue:tail(q2()).
q4() -> ezqueue:snoc(3, q3()).
q5() -> ezqueue:tail(q4()).
q6() -> ezqueue:tail(q5()).

is_empty_q0_test() -> ?assert(ezqueue:is_empty(q0())).
is_empty_q1_test() -> ?assertNot(ezqueue:is_empty(q1())).
is_empty_q2_test() -> ?assertNot(ezqueue:is_empty(q2())).
is_empty_q3_test() -> ?assertNot(ezqueue:is_empty(q3())).
is_empty_q4_test() -> ?assertNot(ezqueue:is_empty(q4())).
is_empty_q5_test() -> ?assertNot(ezqueue:is_empty(q5())).
is_empty_q6_test() -> ?assert(ezqueue:is_empty(q6())).

head_q0_test() -> ?assertError(function_clause, ezqueue:head(q0())).
head_q1_test() -> ?assertEqual(ezqueue:head(q1()), 1).
head_q2_test() -> ?assertEqual(ezqueue:head(q2()), 1).
head_q3_test() -> ?assertEqual(ezqueue:head(q3()), 2).
head_q4_test() -> ?assertEqual(ezqueue:head(q4()), 2).
head_q5_test() -> ?assertEqual(ezqueue:head(q5()), 3).
head_q6_test() -> ?assertError(function_clause, ezqueue:head(q6())).

tail_q0_test() -> ?assertError(function_clause, ezqueue:tail(q0())).
tail_q1_test() -> ?assertEqual(ezqueue:tail(q1()), q0()).
tail_q2_test() -> ?assertEqual(ezqueue:tail(q2()), q3()).
tail_q4_test() -> ?assertEqual(ezqueue:tail(q4()), q5()).
tail_q5_test() -> ?assertEqual(ezqueue:tail(q5()), q0()).
tail_q6_test() -> ?assertError(function_clause, ezqueue:tail(q6())).
