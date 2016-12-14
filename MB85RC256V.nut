//
// MB85RC256V.nut
//
// Library for the Fujitsu MB85RC256V FRAM as used on the Adafruit I2C FRAM
//
// Written 20161213 Leeland Heins for the Esquilo Air
//
const ADDR = 0x50;

class MB85RC256V
{
    i2c = null;
    addr = 0;

    constructor (_i2c, _addr)
    {
        i2c = _i2c;
        addr = _addr;
    }
};

// Write an 8 bit value to memory
function MB85RC256V::write8(framAddr, value)
{
    local b;
    b = blob(3);
    b[0] = framAddr >> 8;
    b[1] = framAddr & 0xFF;
    b[2] = value;
    i2c.address(addr);
    i2c.write(b);
}

// Read an 8 bit value from memory
function MB85RC256V::read8(framAddr)
{
    local a;
    local b;
    local c;
    a = blob(1);
    a[0] = 0;
    b = blob(2);
    b[0] = framAddr >> 8;
    b[1] = framAddr & 0xFF;
    i2c.address(addr);
    i2c.xfer(b, a)
    c = a[0];
    return c;
}

