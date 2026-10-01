# IO 函数速记卡

## 第一组：打开与关闭

### 1. `fopen`

- **调用**：`FILE *fopen(const char *filename, const char *mode);`
- **传入参数**：
  - `filename`：字符串，要打开的文件路径（如 `"data.txt"`）。
  - `mode`：字符串，打开模式。常见有：`"r"`（只读）、`"w"`（只写，清空）、`"a"`（追加）、`"r+"`（读写）、`"rb"`（二进制读）等。
- **变体**：`freopen`、`fdopen`、`fopen_s`。

### 2. `freopen`

- **调用**：`FILE *freopen(const char *filename, const char *mode, FILE *stream);`
- **传入参数**：
  - `filename`：目标文件名。
  - `mode`：打开模式。
  - `stream`：要重定向的现有流（如 `stdout`、`stderr` 或 `stdin`）。
- **作用**：把指定的流重定向到新文件。

### 3. `fdopen`（POSIX）

- **调用**：`FILE *fdopen(int fd, const char *mode);`
- **传入参数**：
  - `fd`：已打开的文件描述符（int，如 `open` 返回的 3、4 等）。
  - `mode`：模式，必须与 `fd` 原本的打开模式兼容。
- **作用**：把底层文件描述符包装成高级 `FILE *` 流。

### 4. `fclose`

- **调用**：`int fclose(FILE *stream);`
- **传入参数**：
  - `stream`：要关闭的 `FILE *` 流指针。
- **变体**：`fcloseall`。

### 5. `fcloseall`（GNU 扩展）

- **调用**：`int fcloseall(void);`
- **传入参数**：无。
- **作用**：一次性关闭当前进程所有打开的流。

## 第二组：读取数据

### 6. `fscanf`

- **调用**：`int fscanf(FILE *stream, const char *format, ...);`
- **传入参数**：
  - `stream`：来源文件流。
  - `format`：格式化字符串（如 `"%d %s"`）。
  - `...`：接收数据的变量地址（**必须加 `&`**，如 `&age`、`name`）。
- **变体**：`scanf`、`sscanf`、`vfscanf`。

### 7. `fgets`

- **调用**：`char *fgets(char *str, int n, FILE *stream);`
- **传入参数**：
  - `str`：接收数据的字符数组（缓冲区）。
  - `n`：最大读取的字符数（包括末尾的 `\0`，所以实际读 `n-1` 个）。
  - `stream`：来源文件流。
- **变体**：`gets`（危险废弃）、`fgetc` / `getc`（单字符）。

### 8. `fread`

- **调用**：`size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);`
- **传入参数**：
  - `ptr`：接收数据的内存缓冲区（如结构体数组地址）。
  - `size`：单个数据块的字节大小（如 `sizeof(int)`）。
  - `nmemb`：要读取的数据块个数。
  - `stream`：来源文件流。
- **变体**：无。与 `fwrite` 配对。

## 第三组：写入数据

### 9. `fprintf`

- **调用**：`int fprintf(FILE *stream, const char *format, ...);`
- **传入参数**：
  - `stream`：目标文件流。
  - `format`：格式化字符串。
  - `...`：要写入的变量值（不需要加 `&`）。
- **变体**：`printf`、`sprintf`、`snprintf`、`vfprintf`。

### 10. `fwrite`

- **调用**：`size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);`
- **传入参数**：
  - `ptr`：要写入的数据所在的内存地址。
  - `size`：单个数据块的字节大小。
  - `nmemb`：要写入的数据块个数。
  - `stream`：目标文件流。
- **变体**：无。与 `fread` 配对。

## 第四组：文件定位

### 11. `fgetpos`

- **调用**：`int fgetpos(FILE *stream, fpos_t *pos);`
- **传入参数**：
  - `stream`：文件流。
  - `pos`：指向 `fpos_t` 结构体的指针，用来**接收**当前的位置信息。
- **变体**：`ftell`（返回 `long` 型偏移量）。

### 12. `fseek`

- **调用**：`int fseek(FILE *stream, long offset, int whence);`
- **传入参数**：
  - `stream`：文件流。
  - `offset`：偏移量（正数向后移，负数向前移）。
  - `whence`：基准位置（`SEEK_SET` 文件头、`SEEK_CUR` 当前位置、`SEEK_END` 文件尾）。
- **变体**：`fseeko`（处理大文件）。

### 13. `ftell`

- **调用**：`long ftell(FILE *stream);`
- **传入参数**：
  - `stream`：文件流。
- **作用**：返回当前读写位置距离文件开头的偏移量（字节数）。
- **变体**：`ftello`。

### 14. `rewind`

- **调用**：`void rewind(FILE *stream);`
- **传入参数**：
  - `stream`：文件流。
- **作用**：把读写位置直接拉回文件开头，并清除错误标记。
