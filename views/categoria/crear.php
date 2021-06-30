<h1>Crear nueva categoría</h1>

<form action="<?=base_url?>categoria/save" method="POST">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre" required/>
    
    <input type="submit" value="Guardar"/>
</form>