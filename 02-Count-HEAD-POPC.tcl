# Lista de archivos GRO
set archivos_gro [lsort [glob "POPC-Protein-WAT-ION-*"]]

# Diccionario para almacenar el conteo por ID POPC
set popc_count_dict [dict create]

# Abrir un archivo para escribir los resultados
set output_file [open "02-Frecuencia-POPC-Frame-CadenaA.txt" w]


# Bucle sobre todos los archivos GRO
foreach archivo_gro $archivos_gro {
    # Cargar la estructura
    mol new $archivo_gro waitfor all

    # Seleccionar los átomos de lípidos (ajusta según tu nomenclatura)
	set lipidos [atomselect top "(within 5 of (index 782 or index 779 or index 780 or index 781 or index 1040 or index 1041 or index 1058 or index 1059 or index 764 or index 765 or index 1036 or index 1037 or index 1148 or index 1149 or index 762 or index 763 or index 1025 or index 1026 or index 1027 or index 1017 or index 1018 or index 859 or index 860 or index 1044 or index 1045 )) and (name PO4)"]

    # Obtener información sobre los átomos de lípidos
    set lipidos_info [$lipidos get {resid resname}]

    # Obtener una lista de IDs de residuos POPC
    set popc_ids [$lipidos get resid]

    # Incrementar el conteo por ID POPC
    foreach popc_id $popc_ids {
        if {[dict exists $popc_count_dict $popc_id]} {
            dict incr popc_count_dict $popc_id
        } else {
            dict set popc_count_dict $popc_id 1
        }
    }

    # Imprimir el resultado en el archivo general
    puts $output_file "En $archivo_gro: [llength $popc_ids] residuos POPC"

    # Liberar la selección y cerrar la molécula
    $lipidos delete
    mol delete top
}

# Imprimir el conteo por ID POPC
puts $output_file "\nConteo por ID POPC:"
dict for {popc_id count} $popc_count_dict {
    puts $output_file "ID POPC: $popc_id - Cantidad: $count"
}

# Cerrar el archivo
close $output_file

