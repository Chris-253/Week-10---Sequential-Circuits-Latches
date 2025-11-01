# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
We cannot use structural Verilog because latches inherently rly on feedback loops, and structural verilog directly describes gate level connections, so when we create a combinational feedback loop, like in an SR latch made of NOR gates, the synthesizer can't guarentee stable timing or correct initialization of the loops in real hardware. So we need to use behavioral verilog using reg types na dalways blocks, to explicitally tell the synthesis tool that the circuit is sequential and it should store latches rather than combinational logic.
### What is the meaning of always @(*) in a sensitivity block?
the always @(*) means "run this block whenever any signal used inside it changes". This is used for combinational logic where outputs should immedietaely respond to any change in inputs.
### What importance is memory to digital circuits?
Memory is important because it allows the ability to store and recall information over time. Without memory every circuit would be purely combinational making it impossible to perform tasks that require context, history, or state.
