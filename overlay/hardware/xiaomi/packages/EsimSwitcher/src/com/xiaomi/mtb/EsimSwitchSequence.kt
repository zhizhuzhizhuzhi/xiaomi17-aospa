package com.xiaomi.mtb

/** The OS4 MiRilHook synchronous ABI: power=true, switch=0 mean success. */
internal fun switchEsim(
    enabled: Boolean,
    power: (Int, Int, Int) -> Boolean,
    select: (Int, Boolean) -> Int,
) {
    check(power(0, 2, -1)) { "SIM power-off request failed" }
    val result = select(if (enabled) 0 else 1, true)
    check(result == 0) { "eSIM selection failed: $result; SIM remains powered off" }
    check(power(1, 2, if (enabled) 1 else 0)) { "SIM power-on request failed" }
}
