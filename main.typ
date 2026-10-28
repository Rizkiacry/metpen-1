// main.typ — entry point for metpen sheets
//
// compile:
//   typst compile metpen/main.typ                            (hasbi)
//   typst compile metpen/main.typ --input student=zain       (zain)
//   typst compile metpen/main.typ --input student=both       (both, 2 pages)
//   add --font-path metpen/fonts if Times New Roman isn't installed
#import "config.typ": form
#import "sections/hasbi.typ": hasbi
#import "sections/zain.typ": zain

#let student = sys.inputs.at("student", default: "hasbi")

#if student == "both" {
  hasbi
  pagebreak()
  zain
} else if student == "zain" {
  zain
} else {
  hasbi
}
