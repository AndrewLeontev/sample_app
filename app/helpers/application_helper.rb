module ApplicationHelper
	#ВОзвращает полный заголовок зависящий от страницы
	def full_title(page_title)								#определение метода
		base_title = "Ruby on Rails Tutorial Sample App"	#назначение переменной
		if page_title.empty?								#булевый тест
			base_title										#Явное возвращение
		else
			"#{base_title} | #{page_title}"					#Интерполяция строки
		end
	end
end
