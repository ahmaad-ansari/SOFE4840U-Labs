# Lab 1: Secret-Key Encryption

## Task 4A: Observing /dev/random Behavior

### Instructions

1. Open a terminal.

2. Run the following command to continuously read pseudo-random numbers from `/dev/random` and display them using `hexdump`:
   ```bash
   ./random.sh
   ```

3. A new terminal will open, showing the continuous output of random values. Another terminal will periodically print the entropy of `/dev/random`.

4. Observe the behavior without moving your mouse or typing anything. Note any changes in the displayed random numbers and entropy.

5. Randomly move your mouse and observe if there is any difference in the displayed random numbers and entropy. Describe and explain your observations.

## Task 4B: Observing /dev/urandom Behavior

### Instructions

1. Open a terminal.

2. Run the following command to continuously read pseudo-random numbers from `/dev/urandom` and display them using `hexdump`:
   ```bash
   ./urandom.sh
   ```

3. A new terminal will open, showing the continuous output of random values. Another terminal will generate 1 MB of pseudo-random numbers from `/dev/urandom` and save them to a file named `output.bin`.

4. Run the `ent` command on the `output.bin` file:
   ```bash
   ent output.bin
   ```

## Note: 
- Exercise caution when working with random devices, especially `/dev/random` and `/dev/urandom`. Always be mindful of potential security implications when working with random number generators.
