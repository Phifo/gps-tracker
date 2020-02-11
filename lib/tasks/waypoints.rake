# frozen_string_literal: true

namespace :waypoints do
  desc 'Generate waypoints example'
  task generate_points: :environment do
    points = [[-70.69127082824706, -33.45403754073398], [-70.6915283203125, -33.456364866148014], [-70.69032669067383, -33.45965881995727], [-70.68998336791992, -33.465243933879066], [-70.68998336791992, -33.47383571415577], [-70.68758010864258, -33.477988102605764], [-70.68895339965819, -33.4821402920467], [-70.69341659545898, -33.492018839206224], [-70.69839477539062, -33.501896259517494], [-70.70783615112305, -33.521504608636306], [-70.70852279663086, -33.52651332821698], [-70.71950912475586, -33.60604149572663], [-70.71796417236328, -33.61376155108331], [-70.71487426757812, -33.637203406257235], [-70.71367263793945, -33.64463485765219], [-70.718994140625, -33.657638354109665], [-70.72225570678711, -33.66506804140365], [-70.72603225708008, -33.67463996177376], [-70.72860717773438, -33.68363945239179], [-70.7274055480957, -33.68735325327766], [-70.72380065917969, -33.69449472706071], [-70.72431564331055, -33.701064358790276], [-70.7280921936035, -33.71548722249545], [-70.73272705078125, -33.72505352836076], [-70.73993682861327, -33.73918686460779], [-70.75538635253905, -33.8300698997189], [-70.74972152709961, -33.859297450398245], [-70.74216842651367, -33.86713728719762], [-70.73598861694335, -33.89948681391328], [-70.73616027832031, -33.90333373867912], [-70.72637557983398, -33.91387627229514], [-70.72843551635741, -33.920429081889196], [-70.72586059570312, -33.92313553009509], [-70.71882247924805, -33.9278359989436], [-70.71418762207031, -33.93823308422682], [-70.71418762207031, -33.94364476321219], [-70.71624755859374, -33.9484865001747], [-70.71676254272461, -33.953755136273514], [-70.70320129394531, -33.986214127142], [-70.7080078125, -34.03445260967644], [-70.71161270141602, -34.036159664315605], [-70.72036743164062, -34.039289175269076], [-70.73341369628906, -34.045263375550654], [-70.75109481811523, -34.05265942137597], [-70.75504302978516, -34.05678385900245], [-70.77718734741211, -34.08664448743108], [-70.78079223632812, -34.094605543881926], [-70.78182220458984, -34.10910411569082], [-70.78817367553711, -34.139088373438476], [-70.79280853271484, -34.15230080698923], [-70.79778671264648, -34.16110794795231], [-70.79452514648436, -34.172612667476244], [-70.78834533691406, -34.19291964055571], [-70.7874870300293, -34.20896295162417], [-70.79246520996094, -34.218190021599234], [-70.79504013061523, -34.2234419024609], [-70.79538345336914, -34.22798380564679], [-70.79504013061523, -34.23493812022693], [-70.79847335815428, -34.24132422972855], [-70.80997467041014, -34.26204027139666], [-70.82405090332031, -34.28587159652361], [-70.83314895629883, -34.32429955337337], [-70.84156036376952, -34.342585649404036], [-70.87778091430664, -34.40648477017429], [-70.88396072387694, -34.41838077212271], [-70.88567733764648, -34.422204127692474], [-70.88739395141602, -34.42602730843172], [-70.89031219482422, -34.435796864855725], [-70.89305877685547, -34.44528215290128], [-70.90112686157227, -34.47061816265395], [-70.90215682983398, -34.475995767558636], [-70.90490341186523, -34.4793919710481], [-70.91005325317383, -34.48420302267625], [-70.91348648071289, -34.488589327926576], [-70.92584609985352, -34.50669808103445], [-70.93846321105957, -34.52819711604961], [-70.94301223754883, -34.53427807308364], [-70.95580101013184, -34.54502472496434], [-70.96283912658691, -34.55117514478884], [-70.96524238586426, -34.5532251837122], [-70.97331047058105, -34.56955300035297], [-70.97356796264648, -34.57195595815898], [-70.96661567687988, -34.58552429876527], [-70.98464012145996, -34.60516619968573], [-70.9892749786377, -34.60996998643594], [-70.99167823791504, -34.62565100237967], [-70.99382400512695, -34.65269732107384], [-70.99511146545409, -34.66173433297161], [-71.00197792053223, -34.66914677104502], [-71.01356506347656, -34.68538122266006], [-71.02729797363281, -34.70422331140433], [-71.03785514831542, -34.725177448317595], [-71.04137420654297, -34.73498244258411], [-71.0430908203125, -34.73702794221469], [-71.04249000549316, -34.749652491484056], [-71.04695320129395, -34.78060620575734], [-71.04806900024413, -34.792025828558856]]

    points.each do |point|
      puts "lat: #{point[0]}, lon: #{point[1]}"

      Faraday.post('http://localhost:3000/api/v1/waypoints',
                   device_serial_number: 'd131dd02c5e6eec4',
                   latitude: point[0].to_f,
                   longitude: point[1].to_f)

      sleep 10
    end
  end
end
