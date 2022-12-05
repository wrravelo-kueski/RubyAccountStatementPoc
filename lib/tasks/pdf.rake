require 'benchmark'

desc "Benchmark pdf creation"

task :benchmark => [ :environment ] do
  times = []
  FinanceProduct.all.each_with_index do |product, index|
    puts index
    exec_time = Benchmark.realtime do
      PdfService.call(product, Time.parse('2022-11-29'), Time.parse('2022-11-30'))
    end
    times << exec_time
  end
  puts "RESULT AVG: #{(times.sum / times.count)}"
  puts "RESULT MAX: #{times.max}"
  puts "RESULT MIN: #{times.min}"
end