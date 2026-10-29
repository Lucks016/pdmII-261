import 'dart:convert';

// 14-agregacao.dart  
// Agregação e Composição

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  Dependente dep1 = Dependente('Ana');
  Dependente dep2 = Dependente('Lucas');
  Dependente dep3 = Dependente('Beatriz');

  Funcionario func1 = Funcionario('Carlos', [dep1, dep2]);
  Funcionario func2 = Funcionario('Mariana', [dep3]);
  Funcionario func3 = Funcionario('João', []);

  List<Funcionario> funcionarios = [func1, func2, func3];

  EquipeProjeto equipe = EquipeProjeto('Sistema de Gestão', funcionarios);

  String jsonEquipe = JsonEncoder.withIndent('  ').convert(equipe.toJson());
  print(jsonEquipe);
}
