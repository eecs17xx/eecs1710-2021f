import gifAnimation.*;

Gif gif;

String apiUrl = "https://api.giphy.com/v1/gifs/search?";
String apiKey;
String query = "dog";

void setup() {
  size(800, 600, P2D);
  
  apiKey = loadStrings("secret.txt")[0];
  
  imageMode(CENTER);
  
  gif = getSingleGif(query, 15); // max results to be returned
  gif.loop();
}

void draw() {
  background(127);
  image(gif, width/2, height/2);
}

void keyPressed() {
  gif = getSingleGif(query, 15);
  gif.loop();
}

ArrayList<String> getGifUrls(String query, int maxGifResults) {
  ArrayList<String> returns = new ArrayList<String>();
  String queryUrl = apiUrl + "&api_key=" + apiKey + "&q=" + query;
  JSONObject json = loadJSONObject(queryUrl);
  //println(json); // uncomment this to see what the json being returned looks like
  JSONArray data = json.getJSONArray("data");
  
  for (int i=0; i<data.size(); i++) {
    try {
      JSONObject datum = data.getJSONObject(i);
      JSONObject images = datum.getJSONObject("images");
      JSONObject original = images.getJSONObject("original");
      String url = original.getString("url").split("\\?")[0];
      String url2 = "https://i.giphy.com/media/" + url.split("/media/")[1];
      returns.add(url2);
    } catch (Exception e) { }
    if (returns.size() >= maxGifResults) break;
  }
  
  return returns;
}

ArrayList<Gif> getGifArray(String query, int maxGifResults) {
  ArrayList<Gif> returns = new ArrayList<Gif>();
  ArrayList<String> urls = getGifUrls(query, maxGifResults);
  
  for (int i=0; i<urls.size(); i++) {
    try {
      returns.add(new Gif(this, urls.get(i)));
    } catch (Exception e) { }
    if (returns.size() >= maxGifResults) break;
  }
  
  return returns;
}

Gif getSingleGif(String query, int maxGifResults) {
  ArrayList<String> urls = getGifUrls(query, maxGifResults);
  Gif returns;
  try {
    returns = new Gif(this, urls.get((int) random(urls.size())));
    return returns;
  } catch (Exception e) {
    returns = null;
  }
  return returns;
}
