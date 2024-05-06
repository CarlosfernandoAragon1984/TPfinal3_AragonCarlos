using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
  public  class Categoria
    {
        //propiedades de Categoria
        public int id { get; set; }
        public string Descripcion { get; set; }

        // sobre escribimos el método ToString() para que devuelva la descripcion
        public override string ToString()
        {
            return Descripcion;
        }
    }
}
