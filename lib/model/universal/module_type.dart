// Module type: DMC, TOTO, MAGNUM, etc
enum ModuleType {
  dmc(0),
  toto(1),
  magnum(2);

  const ModuleType(this.id);
  final int id;
}