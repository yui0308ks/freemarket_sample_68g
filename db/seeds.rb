categories=[
           {level1:"メンズ",level1_children:[
                                               {level2:"トップス",level2_children:["Tシャツ","シャツ","ジャージ"]},
                                               {level2:"ジャケット",level2_children:["テーラードジャケット","Gジャン"]}
                                              ]
           },
           {level1:"レディース",level1_children:[
                                               {level2:"トップス",level2_children:["Tシャツ","シャツ","ジャージ"]},
                                               {level2:"ジャケット",level2_children:["テーラードジャケット","Gジャン"]}
                                              ]
           }
         ]
categories.each.with_index(1) do |category,i|
 level1_var="@category#{i}"                                                        #1階層の変数("@category1"等)
 level1_val= Category.create(name:"#{category[:level1]}")                          #1階層の値作成("カテゴリ　1"等)
 eval("#{level1_var} = level1_val")                                                #1階層の変数=1階層の値
   category[:level1_children].each.with_index(1) do |level1_child,j|
     level2_var="#{level1_var}_#{j}"                                               #2階層の変数("@category1-1"等)
     level2_val= eval("#{level1_var}.children.create(name:level1_child[:level2])") #2階層の値作成("カテゴリ　1-1"等)
     eval("#{level2_var} = level2_val")                                            #2階層の変数=2階層の値
       level1_child[:level2_children].each do |level2_children_val|
         eval("#{level2_var}.children.create(name:level2_children_val)")           #3階層の値作成("カテゴリ　1-1-1"等)
       end
   end
end