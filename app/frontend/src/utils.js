export function isEmpty(value) {
  if (value == null) {
    return true; // null または undefined
  }
  if (typeof value === "string" && value.trim() === "") {
    return true; // 空文字列
  }
  if (Array.isArray(value) && value.length === 0) {
    return true; // 空配列
  }
  if (typeof value === "object" && Object.keys(value).length === 0) {
    return true; // 空オブジェクト
  }
  return false;
}
