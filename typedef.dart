/*typedefs trong dart là một cách ngắn gọn để tạo các alias(bí danh) cho các loại dữ liệu.
Điều này giúp mã nguồn trở nên rõ ràng và dễ đọc hơn, đặc biệt khi làm việc với các loại dữ liệu phức tạp
*/
typedef IntList = List<int>;
void main() {
  IntList l1 = [1, 2, 3, 4, 5];
  print(l1);
}
