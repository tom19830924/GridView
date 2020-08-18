特雷維科技有限公司 iOS面試題目

題目1:
提供一個畫面, 給定兩個input box, 分別輸入大於0的整數: column, row

題目2:
提供一個畫面, 根據題目1所輸入的column與row, 產生格子狀layout且每個column底下皆有一個button
(可使用任一種的UI layout, 請參考sample1)

題目3:
於題目2中, 每10秒random產生兩個數字x與y, x條件為: 1 <= x <= column, y條件為: 1 <= y <= row
根據產生的x與y於對應的位置(column: x, row: y)中顯示"random", 且對應的column與底部的button需被highlight, 並且需清除前一次的random的畫面.
當按下button時清除當前的random的畫面
(請參考sample2)

(限制條件: 題目2的畫面不可scroll)
(iOS: 請支援iPhone與iPad且支援iOS 10以上)
