impl Solution {
    pub fn int_to_roman(mut num: i32) -> String {
        let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
        let mut result = String::new();
        for &(val, sym) in values.iter() {
            while num >= val {
                result.push_str(sym);
                num -= val;
            }
        }
        result
    }
}
