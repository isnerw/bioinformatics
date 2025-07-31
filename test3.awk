BEGIN {
    FS = "\n";
    while ((getline < "search.barcodes.txt") > 0) {
        bar = gensub(/^[ \t]+|[ \t]+$/, "", "g", $1);
        if (bar != "") known[bar] = 1;
    }
}
(NR % 4 == 1) {
    if (match($0, /:([ACGTN]+)\+([ACGTN]+)$/, m)) {
        bc = m[1] "+" m[2];  # e.g., CCTCAGCT+CTAACTCC
        if (bc in known) {
            counts[bc]++;
        }
    }
}
END {
    for (bc in counts) {
        print counts[bc], bc;
    }
}

