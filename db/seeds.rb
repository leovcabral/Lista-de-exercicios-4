# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

professores = ["Alexandre", "Edgardo"]
emails_prof = ["alexandre@unb.br", "edgardo@unb.br"]
bd_prof     = ["1970-02-23".to_date, "1972-06-30".to_date]
linguagens  = ["Javascript", "Ruby"]
alunos      = ["Julio", "Guilherme", "Gustavo", "Beatriz", "Carla"]
matriculas  = ["850016723", "220049572", "250074839", "200037843", "900027384"]
bd_alunos   = ["1970-01-21".to_date, "2004-02-16".to_date, "2006-05-23".to_date, "1999-06-10".to_date, "1972-02-04".to_date]
emails_al   = ["julio@gmail", "guilherme@gmail", "gustavo@gmail", "beatriz@gmail", "carla@gmail"]

2.times do |i|
    puts "Cadastrando profressor"
    Teacher.create(name:professores[i], email:emails_prof[i], birthdate:bd_prof[i])
end 

2.times do |i|
    puts "Cadastrando linguagem"
    Language.create(name:linguagens[i], teacher_id:i+1)

end

5.times do |i|
    if i < 3
        puts "Cadastrando aluno para prof #{professores[0]}"
        Student.create(name:alunos[i], matricula:matriculas[i], email:emails_al[i], birthdate:bd_alunos[i], teacher_id:1) 
    else
        puts "Cadastrando aluno para prof #{professores[1]}"
        Student.create(name:alunos[i], matricula:matriculas[i], email:emails_al[i], birthdate:bd_alunos[i], teacher_id:2)
    end
end