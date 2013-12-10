# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bar1 = Bar.create([
	{name: 'Aji', start_time: 3, end_time: 6, contact: '(303)442-3464', length: 3, area: 'Downtown'},
	{name: 'Alba Restaurant & Wine Bar', start_time: 5, end_time: 6.5, contact: '(303)938-8800', length: 1.5, area: 'Downtown'},
	{name: 'Half Fast Subs', start_time: 5, end_time: 7, contact: '(303)449-0404', length: 2, area: 'The Hill'},
	{name: 'The Sink', start_time: 3, end_time: 6, contact: '(303)444-7465', length: 3, area: 'The Hill'},
	{name: 'Beau Jo\'s Colorado Style Pizza', start_time: 3, end_time: 6, contact: '(303)554-5312', length: 3, area: 'South Boulder'},
	{name: 'Dark Horse', start_time: 4, end_time: 8, contact: '(303)442-8162', length: 4, area: 'South Boulder'},
	{name: 'Boulder Cork', start_time: 4.5, end_time: 6.5, contact: '(303)443-9505', length: 2, area: 'North Boulder'}
	])