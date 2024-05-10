# Lista de archivos PDB (ajusta los nombres según sea necesario)
set archivos_pdb [lsort [glob "POPC-Protein-WAT-ION-*"]]


# Abrir un archivo para escribir los resultados
set output_file [open "Frecuencia-POPC-1927-ChainA.txt" w]
set popc_seleccionado "resid 1927 and name PO4"

# Bucle sobre todos los archivos PDB
foreach archivo_pdb $archivos_pdb {
    # Cargar la estructura actual
    mol addfile $archivo_pdb waitfor all

    # Obtener la lista de residuos y seleccionar el más cercano al POPC
    set residuo_mas_cercano [atomselect top "(within 5 of (resid 1927 and name PO4)) and ((resname PHE and resid 333) or (resname LEU and resid 450) or (resname ILE and resid 458) or (resname MET and resid 325) or (resname ASP and resid 448) or (resname ASN and resid 493) or (resname ASN and resid 324) or (resname ARG and resid 443) or (resname GLU and resid 440) or (resname ASN and resid 367) or (resname THR and resid 452))" frame 0]

    # Obtener información sobre el residuo más cercano
    set residuo_mas_cercano_info [$residuo_mas_cercano get {resname resid name}]

    # Imprimir el resultado en el archivo
    puts $output_file "Archivo: $archivo_pdb - Residuo más cercano a $popc_seleccionado:"
    puts $output_file $residuo_mas_cercano_info

    # Liberar la estructura actual
    mol delete top
}

# Cerrar el archivo
close $output_file

# Cerrar las selecciones
$residuo_mas_cercano delete



