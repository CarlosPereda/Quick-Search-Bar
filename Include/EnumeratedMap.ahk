#Requires AutoHotkey v2.0

class EnumeratedMap extends Map{
    selectKey(index){
        return this.keys[Mod(index, this.count)+1]
    }

    keys{
        get{
            keys_array := []
            for k, v in this
                keys_array.push(k)
            return keys_array
       }
    }
}
