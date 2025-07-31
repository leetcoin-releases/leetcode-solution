function convert(s: string, numRows: number): string {
    if (numRows === 1 || s.length <= numRows) return s;
    let rows: string[] = Array(Math.min(numRows, s.length)).fill("");
    let curRow = 0;
    let goingDown = false;
    for (let c of s) {
        rows[curRow] += c;
        if (curRow === 0 || curRow === numRows - 1) goingDown = !goingDown;
        curRow += goingDown ? 1 : -1;
    }
    return rows.join("");
}