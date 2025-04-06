#!/bin/bash

NOTAS_DIR="notas"

mkdir -p "$NOTAS_DIR"

adicionar_nota() {
	echo -ne "\nTitulo da Nota: "; read titulo
	echo -e "Conteúdo da Nota (CTRL + D para salvar)\n"
	cat > "$NOTAS_DIR/$titulo.txt"
	echo -e "\n\e[2;32mNota salva com sucesso.\e[0m"
}

listar_notas() {
	echo -e "\nSuas Notas:\n"
	local i=1

	for nota in "$NOTAS_DIR"/*.txt; do
		name=$(basename "$nota" .txt)
		echo "$i. $name"
		((i++))
	done
}

buscar_nota() {
	echo -e "\nDigite o titulo da Nota que deseja ler: "; read titulo
	cat "$NOTAS_DIR/$titulo.txt" 2> /dev/null || echo "Nota não encontrada!"
}

editar_nota() {
	listar_notas

	local i=1

	echo -e "\nDigite o número da Nota que deseja editar: "; read numero

	for nota in "$NOTAS_DIR"/*.txt; do
		if [ "$i" -eq "$numero" ]; then
			micro "$nota"
			echo -e "\n\e[2;32mNota atualizada com sucesso.\e[0m"
			return
		fi
		((i++))
	done
	echo "Nota não encontrada!"
}

while true; do
	echo -e "\nEscolha uma opção: \n"
	
	echo "1. Adicionar Nota"
	echo "2. Listar Notas"
	echo "3. Buscar Nota"
	echo "4. Editar Nota"
	echo "5. Sair"

	read opcao

	case "$opcao" in
		1) adicionar_nota		  ;;
		2) listar_notas			  ;;
		3) buscar_nota			  ;;
		4) editar_nota			  ;;
		5) break				  ;;
		*) echo "Opção inválida!" ;;
	esac
done
