<!DOCTYPE html>
<html class="no-js">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>GD3 Example Transcript Annotation</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <div id="test1">
      <b>Select protein domain database for first transcript plot</b><br/>
      <input type="radio" name="domain" value="CD"> CD
      <br/>
      <input type="radio" name="domain" value="PFAM" checked="checked"> PFAM
      <br/>
      <input type="radio" name="domain" value="SMART"> SMART
    </div>
    <div id="test2"></div>
    <div id="test3"></div>
    <script src="plugins/gd3/bower_components/d3/d3.min.js"></script>
    <script src="plugins/gd3/gd3.js"></script>
    <!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
   
    <script>
   
    d3.json("plugins/gd3-master/demo/testData/example3-transcript.json", function(data) {
    	//alert(JSON.stringify(data));
    	data = {
    			"chr1:11100-213416453":{ //氓聸戮莽聣聡盲赂禄title
    				"p-type":{  //氓聸戮莽聣聡氓聣炉title
    					"mutations":[ //莽陋聛氓聫聵盲陆聧莽聜鹿莽職聞盲驴隆忙聛炉    ty:莽陋聛氓聫聵莽卤禄氓聻聥(忙聹聣氓聡聽莽搂聧氓聫炉茅聙聣茂录聦氓炉鹿氓潞聰氓聸戮盲赂颅莽聜鹿莽職聞莽卤禄氓聻聥盲赂聧氓聬聦) locus:11氓聮聦581盲陆聧莽陆庐忙聹聣盲赂陇盲赂陋莽陋聛氓聫聵     dataset:盲禄聙盲鹿聢莽聶聦莽聴聡(盲赂聧氓聬聦莽聶聦莽聴聡莽陋聛氓聫聵盲陆聧莽聜鹿盲赂聧氓聬聦茅垄聹猫聣虏)   sample:忙聽路忙聹卢氓聫路(莽聸赂氓聬聦忙聽路忙聹卢氓聫路茂录聦hover盲赂聤茅聺垄盲录職氓聬聦忙聴露忙聵戮莽陇潞氓聡潞氓聹聢氓聹聢)  gene:"genome"
    						{"ty":"Others","locus":"11","dataset":"UCEC","sample":"TCGA-24-1568","gene":"genome"},
    						{"ty":"Others","locus":"581","dataset":"OV","sample":"TCGA-24-1565","gene":"genome"},
    						{"ty":"frame mutation","locus":"4000","dataset":"OV","sample":"TCGA-24-1565","gene":"genome"},
    						{"ty":"frame mutation","locus":"4000","dataset":"UCEC","sample":"TCGA-24-1565","gene":"genome"},
    						{"ty":"Others","locus":"59","dataset":"PRAD","sample":"TCGA-24-1565","gene":"genome"},
    					],
    					"gene":"genome",
    					"length":5000,   //忙聵戮莽陇潞氓聼潞氓聸聽莽禄聞茅聲驴氓潞娄(0-5000)忙掳赂猫驴聹茅聝陆忙聵炉盲禄聨0氓录聙氓搂聥
    					"domains":{  //peak氓聦潞氓聼聼盲禄聨400氓聢掳713茂录聦氓聬聧氓颅聴氓聫炉盲禄楼猫聡陋氓庐職盲鹿聣
    						"PFAM":[
    							{"end":713,"start":400,"name":"peak"}
    						]
    					}
    				}
    			}

    		}
//     		data = {
//     			    "chr6:28234156-28234178": { //title
//     			        "rs2799077": { //subtitle
//     			            "gene": "genome",
//     			            "mutations": [
//     			                {
//     			                    "ty": "Others",
//     			                    "locus": "500",
//     			                    "dataset": "gastric cancer"
//     			                }
//     			            ],
//     			            "domains": {
//     			                "PFAM": [
//     			                    {
//     			                        "end": "600",
//     			                        "start": "400",
//     			                        "name": "enhancer"
//     			                    }
//     			                ]
//     			            },
//     			            "length": "1000"
//     			        }
//     			    }
//     			}
      var styling = {
        height: 180, //氓聸戮莽聣聡茅芦聵氓潞娄
        width: 800 //氓聸戮莽聣聡氓庐陆氓潞娄
      };

      var sampleTypes = {},
          params = {showScrollers: false},
          vizData = [];

      params.style=styling;

      var categories = ['BLCA', 'BRCA', 'COADREAD', 'GBM', 'HNSC', 'LUAD', 'LUSC', 'OV', 'SCNAH'];

      for (gKey in Object.keys(data)) {
        var gene = Object.keys(data)[gKey],
            transcriptList = Object.keys(data[gene]);
        	
        	alert(JSON.stringify(gene));//title
            alert(JSON.stringify(transcriptList)); //"rs2799077"
        
            for (tKey in transcriptList) {
          var transcript = transcriptList[tKey],
              domains = data[gene][transcript].domains,
              length = data[gene][transcript].length,
              mutations = data[gene][transcript].mutations,
              //alert(JSON.stringify(mutations));
              sequence = data[gene][transcript].protein_sequence,
              sequence_annotations = data[gene][transcript].sequence_annotations;
              alert(JSON.stringify(domains));
              alert(JSON.stringify(mutations));
              //alert(JSON.stringify(sequence));
          var mKeys = Object.keys(mutations);
          alert(JSON.stringify(mKeys)); //浣嶇疆
          for(mKey in mKeys) {
            var m = mKeys[mKey],
                cancer = mutations[m].cancer;
            alert(JSON.stringify(m));
            //alert(JSON.stringify(cancer));
            sampleTypes[cancer] = 0;
          }

          vizData.push({gene: gene, transcript: transcript, domains: domains, length: length, mutations: mutations, mutationCategories: categories, protein_sequence: sequence, sequence_annotations: sequence_annotations, proteinDomainDB: 'PFAM'});
          alert(JSON.stringify(vizData[0]));     
            }
      }
      sampleTypes = Object.keys(sampleTypes);
      //alert(JSON.stringify(sampleTypes));
      params.sampleTypes = sampleTypes;

      // Draw STAG1 where no scrollbar should appear
      var transcriptFn = gd3.transcript(params);
      d3.select('#test1')
        .append('h3')
        .html(vizData[0].gene + " <small>" + vizData[0].transcript + "</small>");
      d3.select('#test1')
          .datum(vizData[0])
          .call(transcriptFn);

//       $('#test1 input').click(function(){
//         if ($(this).is(':checked')){
//           transcriptFn.setDomainDB($(this).val());
//         }
//       });

      // Draw BRAF where an activating (top) scrollbar should appear
//       d3.select('#test2')
//         .append('h3')
//         .html(vizData[1].gene + " <small>" + vizData[1].transcript + "</small>");
//       d3.select('#test2')
//           .datum(vizData[1])
//           .call(gd3.transcript(params));

      // Draw ARID1A where both inactivating (bottom) and activating (top)
      // scrollbars should appear
//       d3.select('#test3')
//         .append('h3')
//         .html(vizData[2].gene + " <small>" + vizData[2].transcript + "</small>");
//       d3.select('#test3')
//           .datum(vizData[2])
//           .call(gd3.transcript(params));
    });
    </script>
  </body>
</html>
