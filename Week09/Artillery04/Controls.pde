void keyPressed() {
  switch(key) {
    case ' ':
      if (!fullAuto) cannon.fire();
      break;
    case 'a':
      fullAuto = !fullAuto;
      break;
  }
}
