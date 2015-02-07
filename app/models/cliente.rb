class Cliente < ActiveRecord::Base
	def self.xUltimoUso (usuario)
		find_by_sql("select * from clientes as a left join (select max(id) as gasto_id,cliente_id, 
			user_id from gastos group by cliente_id) as b on a.id = b.cliente_id 
			where user_id = #{usuario}
			order by b.gasto_id desc")
	end
end
