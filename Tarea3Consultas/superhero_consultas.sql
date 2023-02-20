
/*1. Conocer los superpoderes de cada superheroe*/
use superhero
select sp.superhero_name, hp.power_id, spw.power_name from hero_power hp
left join superhero sp 
on hp.hero_id=sp.id
left join superpower spw
on hp.power_id=spw.id;


/*2. De cada productor(publisher) mostrar cuantos hombres y mujeres(gender) hay*/
select * from(
select p.publisher_name, g.gender, count(p.id) cantidad from superhero sp
inner join publisher p
on sp.publisher_id=p.id
inner join gender g
on sp.gender_id=g.id
group by p.publisher_name, g.gender
)
as datos
Pivot(count(Cantidad) for gender in ([Male],[Female]))pivot_table;


/*3. Mostrar todos los colores que componen a cada superheroe*/
select c.id, c.colour from superhero sh
right join colour c
on sh.skin_colour_id=c.id
where sh.id is null;

/*4. Listar los atributos de cada superheroe*/
select sp.superhero_name, ha.attribute_id, a.attribute_name from hero_attribute ha
inner join superhero sp
on ha.hero_id=sp.id
inner join attribute a
on ha.attribute_id=a.id
order by superhero_name asc;


/*5. Mostrar la calificacion de cada superheroe*/
select sp.superhero_name, sp.alignment_id, a.alignment from superhero sp
left join alignment a
on sp.alignment_id=a.id
