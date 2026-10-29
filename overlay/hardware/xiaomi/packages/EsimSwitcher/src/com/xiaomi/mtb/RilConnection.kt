/*
 * SPDX-FileCopyrightText: 2026 Paranoid Android
 * SPDX-License-Identifier: Apache-2.0
 */
package com.xiaomi.mtb

/** Confined to the RIL executor. Only transport events change readiness. */
internal class RilConnection {
    sealed interface State {
        data object Connecting : State
        data object Ready : State
        data class Disconnected(val error: Exception) : State
    }
    private data class Operation(val run: () -> Unit, val fail: (Exception) -> Unit)
    private val pending = ArrayDeque<Operation>()
    private val observers = linkedMapOf<Any, (State) -> Unit>()
    var state: State = State.Connecting
        private set

    fun observe(key: Any, observer: (State) -> Unit) {
        observers[key] = observer
        observer(state)
    }
    fun removeObserver(key: Any) { observers.remove(key) }
    fun submit(run: () -> Unit, fail: (Exception) -> Unit) {
        when (val current = state) {
            State.Ready -> run()
            State.Connecting -> pending.addLast(Operation(run, fail))
            is State.Disconnected -> fail(current.error)
        }
    }
    fun ready() {
        if (state == State.Ready) return
        state = State.Ready
        observers.values.toList().forEach { it(state) }
        while (state == State.Ready && pending.isNotEmpty()) pending.removeFirst().run()
    }
    fun disconnected(error: Exception) {
        state = State.Disconnected(error)
        observers.values.toList().forEach { it(state) }
        while (pending.isNotEmpty()) pending.removeFirst().fail(error)
    }
}
