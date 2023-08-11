# Whether we should clean conflicting outputs
should_clean=0

while getopts "c" arg; do
  case $arg in
  c) should_clean=1;;
  ?) show_help=1;;
  esac
done

if [ $should_clean == 1 ]; then
  dart run clean
fi

dart run build_runner build --delete-conflicting-outputs
