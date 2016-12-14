//
// MB85RC256V_demo.nut
//
// Test program for Esquilo MB85RC256V library.
//
// 20161213 Leeland Heins
//
require("I2C");

// Create an I2C instance
i2c <- I2C(0);

// Load the library.
dofile("sd:/MB85RC256V.nut");

// Create an instance.
local fram = MB85RC256V(i2c, 0x50);

// Read the first byte of the file.
local numreads = fram.read8(0x0000);

// Increment it.
numreads++;

// Wrap around if necessary.
if (numreads > 255) {
    numreads = 0;
}
// Write it back to FRAM.
fram.write8(0x0000, numreads);

print("numreads=" + numreads + "\n");

// Write AB to the FRAM
fram.write8(0x0001, 65);
fram.write8(0x0002, 66);

local ack;
local pth;

// Read it back.
ack = fram.read8(0x0001);
pth = fram.read8(0x0002);

// Output it.
print("ack=" + ack + "\n");
print("pth=" + pth + "\n");

