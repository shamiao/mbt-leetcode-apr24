let g_buffer: @vec.Vec[Bytes] = @vec.Vec::with_capacity(2)

pub fn append_arr(count: Int, input_buffer: Int, output_buffer: Int) -> Int {
  let input: @vec.Vec[Int] = @vec.Vec::with_capacity(count);
  for i = 0; i < count; i = i + 1 {
    input.push(@representation.int_le_from_bytes(g_buffer[input_buffer], 16 + i * 4))
  }

  let output = @lib.append_arr(input)

  expand_buffer(output_buffer, output.length() * 4)
  for i = 0; i < output.length(); i = i + 1 {
    println(output[i])
    @representation.int_into_bytes_le(output[i], g_buffer[output_buffer], 16 + i * 4)
  }
  output.length()
}

pub fn allocate_buffer(index: Int, magic_number: Int64, size: Int) -> Int {
  let index = if index >= 0 {
    if index >= g_buffer.length() {
      g_buffer.resize(index + 1, Bytes::make(0, 0))
    }
    index
  } else {
    g_buffer.push(Bytes::make(0, 0))
    g_buffer.length() - 1
  }
  let target_size = size + 8 + 8
  if g_buffer[index].length() < target_size {
    g_buffer[index] = Bytes::make(size + 8 + 8, 0);
    // fixed magic number 0xff724bedbf3d1e07L (little-endian)
    @representation.int64_into_bytes_le(0xff724bedbf3d1e07L, g_buffer[index], 0)
  }
  // caller specified magic number (use little-endian)
  @representation.int64_into_bytes_le(magic_number, g_buffer[index], 8)
  index
}

fn expand_buffer(index: Int, size: Int) -> Unit {
  let target_size = size + 8 + 8
  if g_buffer[index].length() < target_size {
    let old_buffer = g_buffer[index]
    g_buffer[index] = Bytes::make(size + 8 + 8, 0);
    for i = 0; i < 16 && i < old_buffer.length(); i = i + 1 {
      g_buffer[index][i] = old_buffer[i]
      old_buffer[i] = 0
    }
  }
}

fn main {}
