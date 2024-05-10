# Lista de archivos GRO
set archivos_gro [lsort [glob "POPC-Protein-WAT-ION-*"]]


# Abrir un archivo para escribir los resultados
set output_file [open "01-Informacion-POPC-Frame-ChainB.txt" w]
set output_numero [open "01-Lista-POPC-ChainB.txt" w]


# Bucle sobre todos los archivos GRO
foreach archivo_gro $archivos_gro {
    # Cargar la estructura
    mol new $archivo_gro waitfor all

    # CADENA A
#	set lipidos [atomselect top "(within 5 of (index 782 or index 779 or index 780 or index 781 or index 1040 or index 1041 or index 1058 or index 1059 or index 764 or #index 765 or index 1036 or index 1037 or index 1148 or index 1149 or index 762 or index 763 or index 1025 or index 1026 or index 1027 or index 1017 or index 1018 or index 859 #or index 860 or index 1044 or index 1045 )) and (name PO4)"]

 # CADENA B
	set lipidos [atomselect top "(within 5 of (index 2316 or index 2317 or index 2318 or index 2319 or index 2577 or index 2578 or index 2596 or index 2595 or index 2301 or index 2302 or index 2373 or index 2374 or index 2685 or index 2686 or index 2299 or index 2300 or index 2562 or index 2563 or index 2564 or index 2554 or index 2555 or index 2396 or index 2397 or index 2581 or index 2582)) and (name PO4)"]

    # Obtener información sobre los átomos de lípidos
    set lipidos_info [$lipidos get {resid resname}]

    # Contar los átomos de lípidos
    set lipidos_numero [$lipidos num]

    # Imprimir el resultado en el archivo
    puts $output_file "En $archivo_gro: $lipidos_numero lípidos"

    # Imprimir información sobre residuos de lípidos
    puts $output_file "Residuos de lípidos:"
    puts $output_file $lipidos_info

    puts $output_numero "$lipidos_numero"

    # Liberar la selección y cerrar la molécula
    $lipidos delete
    mol delete top
}

# Cerrar el archivo
close $output_file
close $output_numero


