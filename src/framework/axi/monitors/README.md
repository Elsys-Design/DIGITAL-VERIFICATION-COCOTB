
## Monitors
This directory defines the framework's monitors.


### BaseAxiMonitor
The BaseAxiMonitor is the base class for the AxiMonitor and the AxiLiteMonitor.
It basically handles both Axi and AxiLite buses with the specialisation in child classes limited to setting the right
cocotbext.axi channel monitor's (ex: AxiAWMonitor vs AxiLiteAWMonitor, ...).
It's a wrapper for cocotbext.axi's channel monitors that puts them together to log Data and Stimuli items.

#### Channels tasks and queues
Each channel (aw, w, b, ar, r) has a specific task that handles the reception of the channel's items.
Items are processed into Stimuli and Data when the transaction is over.
For write transactions, it's when we receive an item on the b channel.
For read transactions:
- Axi: it's when we receive the last r item (rlast signal asserted)
- AxiLite: it's when we receive an item on the r channel (only unitary transfers, each item is the last)

Hence, we use queues to store the items of the aw, w, ar and r channels until the transaction is over.
Items on the b channels don't need a queue because they signify the end of a write transaction so we can process them
directly.
When a transaction is over, we call `build_write_stimuli` or `build_read_stimuli` to actually build the stimuli from
the data in the queues (+ the b channel's item that is passed as parameter instead of through a queue for writes).

#### ids
Axi buses have ids on each channel (w channel has an id only in Axi3, not Axi4).
We handle this behaviour by having one queue for each channel and for each ID.
This allows to receive data out of order for different ids while keeping the order for each id.
AxiLite buses do not have ids so there is only one queue for each channel.



### AxiStreamMonitor
Wrapper for the cocotbext.axi.AxiStreamMonitor but logs Data and Stimuli.

#### tlast or no tlast
For axi stream buses without a tlast signal, the monitor will log one Stimuli per unitary transfers
(similarly to cocotbext.axi.AxiStreamMonitor's behaviour which logs a frame at every unitary transfers).
For axi stream buses with a tlast signal, the monitor will log ONLY ON TLAST (again, same as cocotbext.axi's monitor).
This means that if a packet starts on a bus with a tlast signal but tlast is never asserted again in the test, the
packet will not be logged by the monitor.
