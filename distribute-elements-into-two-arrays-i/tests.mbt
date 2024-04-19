test "test1" {
  (append_arr(@vec.Vec::[2, 1, 3]) |> @assertion.assert_eq(@vec.Vec::[2, 3, 1]))?
}

test "test2" {
  (append_arr(@vec.Vec::[5, 4, 3, 8])
  |> @assertion.assert_eq(@vec.Vec::[5, 3, 4, 8]))?
}

test "test3" {
  (append_arr(
    @vec.Vec::[1, 8, 0, 6, 7, 5, 0, 3, 8, 6, 4, 5, 2, 0, 6, 4, 1, 2, 0],
  )
  |> @assertion.assert_eq(
    @vec.Vec::[1, 6, 7, 5, 0, 8, 0, 3, 8, 6, 4, 5, 2, 0, 6, 4, 1, 2, 0],
  ))?
}

test "test4" {
  (append_arr(
    @vec.Vec::[3, 2, 1, 2, 3, 4, 3, 2, 0, 0, 3, 2, 1, 2, 3, 4, 3, 2, 0, 0],
  )
  |> @assertion.assert_eq(
    @vec.Vec::[3, 1, 0, 2, 2, 3, 4, 3, 2, 0, 3, 2, 1, 2, 3, 4, 3, 2, 0, 0],
  ))?
}
