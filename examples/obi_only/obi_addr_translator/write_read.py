import cocotb

from tb import TB


async def do(tb, addr, data):
    err = await tb.m.write(addr, data)
    assert err == 0
    rdata, err = await tb.m.read(addr)
    assert err == 0
    assert rdata == data

    slave_select = addr // 0x1000
    assert tb.s[slave_select][addr % 0x1000] == data


@cocotb.test()
async def write_read(dut):
    tb = TB(dut)
    await tb.reset()

    await do(tb, 0x10, 0xABCDEFFE)
    await do(tb, 0x14, 0x01234567)
    await do(tb, 0x19, 0x76543210)


    await do(tb, 0x1018, 0xFEDCAB)
    await do(tb, 0x15AC, 0x11223344)
    await do(tb, 0x1113, 0x12)
