#!/bin/awk -f

function new_extract_script() {
        print "#!/bin/sh" > "extract.sh";
        close("extract.sh");
}

function write_line_to_extract_script() {
        printf "tar -C ./rootfs -xvf %s\n", $0 >> "extract.sh";
        close("extract.sh");
}

BEGIN {
  new_extract_script();
}

NR == 1 {
        print $0 > "config.json";
        close("config.json");
}

NR > 1 {
  write_line_to_extract_script();
}

END {
        printf "contains %d layers\n", NR;
}