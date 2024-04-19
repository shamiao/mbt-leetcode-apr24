let g_input: @vec.Vec[Int] = @vec.Vec::new()
let g_output: Ref[@vec.Vec[Int]] = { val: @vec.Vec::new() }

pub fn push_input_num(v: Int) -> Unit {
  g_input.push(v)
}

pub fn solve() -> Int {
  g_output.val = @lib.append_arr(g_input)
  g_output.val.length()
}

pub fn get_output_num(index: Int) -> Int {
  g_output.val[index]
}

fn main {}
